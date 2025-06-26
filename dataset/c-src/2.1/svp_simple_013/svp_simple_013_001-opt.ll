; ModuleID = 'svp_simple_013_001-opt.bc'
source_filename = "./svp_simple_013_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_013_001_global_flag1 = global i32 0, align 4
@svp_simple_013_001_global_flag2 = global i32 1, align 4
@svp_simple_013_001_global_var1 = common global i32 0, align 4
@svp_simple_013_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  call void @disable_isr(i32 3), !dbg !12
  br label %1, !dbg !13

1:                                                ; preds = %9, %0
  %.0 = phi i32 [ 0, %0 ], [ %10, %9 ], !dbg !14
  %2 = icmp slt i32 %.0, 100, !dbg !15
  br i1 %2, label %4, label %3, !dbg !16

3:                                                ; preds = %1
  br label %11

4:                                                ; preds = %1
  %5 = icmp eq i32 %.0, 99, !dbg !17
  br i1 %5, label %6, label %8, !dbg !18

6:                                                ; preds = %4
  %7 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !19, !tbaa !20
  br label %8, !dbg !24

8:                                                ; preds = %6, %4
  br label %9, !dbg !25

9:                                                ; preds = %8
  %10 = add nsw i32 %.0, 1, !dbg !26
  br label %1, !dbg !16, !llvm.loop !27

11:                                               ; preds = %3
  %12 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !28, !tbaa !20
  %13 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !29, !tbaa !20
  %14 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !30, !tbaa !20
  ret void, !dbg !31
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_1() #0 !dbg !32 {
  call void (...) @idlerun(), !dbg !33
  call void @enable_isr(i32 2), !dbg !34
  call void (...) @idlerun(), !dbg !35
  ret void, !dbg !36
}

declare void @idlerun(...) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_2() #0 !dbg !37 {
  call void (...) @idlerun(), !dbg !38
  store i32 1, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !39, !tbaa !20
  store i32 0, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !40, !tbaa !20
  call void @enable_isr(i32 3), !dbg !41
  call void (...) @idlerun(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @svp_simple_013_001_isr_3() #0 !dbg !44 {
  %1 = load i32, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !45, !tbaa !20
  %2 = icmp eq i32 %1, 1, !dbg !46
  br i1 %2, label %3, label %4, !dbg !45

3:                                                ; preds = %0
  store volatile i32 1, i32* @svp_simple_013_001_global_var1, align 4, !dbg !47, !tbaa !20
  br label %4, !dbg !48

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !49, !tbaa !20
  %6 = icmp eq i32 %5, 1, !dbg !50
  br i1 %6, label %7, label %8, !dbg !49

7:                                                ; preds = %4
  store volatile i32 1, i32* @svp_simple_013_001_global_var2, align 4, !dbg !51, !tbaa !20
  br label %8, !dbg !52

8:                                                ; preds = %7, %4
  ret void, !dbg !53
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_013_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_013")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_013_001_main", scope: !8, file: !8, line: 13, type: !9, scopeLine: 13, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_013_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_013")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 14, column: 3, scope: !7)
!11 = !DILocation(line: 15, column: 3, scope: !7)
!12 = !DILocation(line: 16, column: 3, scope: !7)
!13 = !DILocation(line: 23, column: 8, scope: !7)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocation(line: 23, column: 21, scope: !7)
!16 = !DILocation(line: 23, column: 3, scope: !7)
!17 = !DILocation(line: 24, column: 11, scope: !7)
!18 = !DILocation(line: 24, column: 9, scope: !7)
!19 = !DILocation(line: 24, column: 33, scope: !7)
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C/C++ TBAA"}
!24 = !DILocation(line: 24, column: 23, scope: !7)
!25 = !DILocation(line: 24, column: 14, scope: !7)
!26 = !DILocation(line: 23, column: 36, scope: !7)
!27 = distinct !{!27, !16, !19}
!28 = !DILocation(line: 26, column: 13, scope: !7)
!29 = !DILocation(line: 28, column: 13, scope: !7)
!30 = !DILocation(line: 30, column: 13, scope: !7)
!31 = !DILocation(line: 31, column: 1, scope: !7)
!32 = distinct !DISubprogram(name: "svp_simple_013_001_isr_1", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 34, column: 3, scope: !32)
!34 = !DILocation(line: 35, column: 3, scope: !32)
!35 = !DILocation(line: 36, column: 3, scope: !32)
!36 = !DILocation(line: 37, column: 1, scope: !32)
!37 = distinct !DISubprogram(name: "svp_simple_013_001_isr_2", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 40, column: 3, scope: !37)
!39 = !DILocation(line: 41, column: 35, scope: !37)
!40 = !DILocation(line: 43, column: 35, scope: !37)
!41 = !DILocation(line: 45, column: 3, scope: !37)
!42 = !DILocation(line: 46, column: 3, scope: !37)
!43 = !DILocation(line: 47, column: 1, scope: !37)
!44 = distinct !DISubprogram(name: "svp_simple_013_001_isr_3", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 50, column: 7, scope: !44)
!46 = !DILocation(line: 50, column: 39, scope: !44)
!47 = !DILocation(line: 50, column: 76, scope: !44)
!48 = !DILocation(line: 50, column: 45, scope: !44)
!49 = !DILocation(line: 51, column: 7, scope: !44)
!50 = !DILocation(line: 51, column: 39, scope: !44)
!51 = !DILocation(line: 51, column: 76, scope: !44)
!52 = !DILocation(line: 51, column: 45, scope: !44)
!53 = !DILocation(line: 52, column: 1, scope: !44)
