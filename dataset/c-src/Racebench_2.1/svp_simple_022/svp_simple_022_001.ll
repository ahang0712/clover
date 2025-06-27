; ModuleID = 'svp_simple_022_001.bc'
source_filename = "./svp_simple_022_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  call void @svp_simple_022_001_init(), !dbg !10
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !11, !tbaa !12
  call void @svp_simple_022_001_func_1(), !dbg !16
  %2 = bitcast i32* %1 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !17
  store i32 0, i32* %1, align 4, !dbg !18, !tbaa !12
  br label %3, !dbg !19

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %1, align 4, !dbg !20, !tbaa !12
  %5 = icmp slt i32 %4, 256, !dbg !21
  br i1 %5, label %6, label %13, !dbg !22

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4, !dbg !23, !tbaa !12
  %8 = sext i32 %7 to i64, !dbg !24
  %9 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %8, !dbg !24
  store volatile i32 0, i32* %9, align 4, !dbg !25, !tbaa !12
  br label %10, !dbg !26

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !27, !tbaa !12
  %12 = add nsw i32 %11, 1, !dbg !27
  store i32 %12, i32* %1, align 4, !dbg !27, !tbaa !12
  br label %3, !dbg !22, !llvm.loop !28

13:                                               ; preds = %3
  call void @svp_simple_022_001_func_2(), !dbg !29
  %14 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !30, !tbaa !12
  store volatile i32 %14, i32* @svp_simple_022_001_global_var3, align 4, !dbg !31, !tbaa !12
  %15 = bitcast i32* %1 to i8*, !dbg !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !32
  ret void, !dbg !32
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !33 {
  call void @disable_isr(i32 -1), !dbg !34
  call void (...) @init(), !dbg !35
  call void @enable_isr(i32 -1), !dbg !36
  ret void, !dbg !37
}

declare void @disable_isr(i32) #2

declare void @init(...) #2

declare void @enable_isr(i32) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !38 {
  call void @svp_simple_022_001_func_3(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !41 {
  call void @svp_simple_022_001_func_4(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !44 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !45, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !46
  br i1 %2, label %3, label %4, !dbg !45

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !47, !tbaa !12
  br label %5, !dbg !48

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !49, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !51 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !52, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !53, !tbaa !12
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !55 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !56, !tbaa !12
  ret void, !dbg !57
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_022")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_022")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 15, column: 3, scope: !7)
!11 = !DILocation(line: 17, column: 34, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 18, column: 3, scope: !7)
!17 = !DILocation(line: 19, column: 3, scope: !7)
!18 = !DILocation(line: 20, column: 10, scope: !7)
!19 = !DILocation(line: 20, column: 8, scope: !7)
!20 = !DILocation(line: 20, column: 15, scope: !7)
!21 = !DILocation(line: 20, column: 17, scope: !7)
!22 = !DILocation(line: 20, column: 3, scope: !7)
!23 = !DILocation(line: 21, column: 37, scope: !7)
!24 = !DILocation(line: 21, column: 5, scope: !7)
!25 = !DILocation(line: 21, column: 40, scope: !7)
!26 = !DILocation(line: 22, column: 3, scope: !7)
!27 = !DILocation(line: 20, column: 25, scope: !7)
!28 = distinct !{!28, !22, !26}
!29 = !DILocation(line: 23, column: 3, scope: !7)
!30 = !DILocation(line: 24, column: 36, scope: !7)
!31 = !DILocation(line: 24, column: 34, scope: !7)
!32 = !DILocation(line: 25, column: 1, scope: !7)
!33 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 28, column: 3, scope: !33)
!35 = !DILocation(line: 33, column: 3, scope: !33)
!36 = !DILocation(line: 34, column: 3, scope: !33)
!37 = !DILocation(line: 35, column: 1, scope: !33)
!38 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 37, column: 36, scope: !38)
!40 = !DILocation(line: 37, column: 65, scope: !38)
!41 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 39, column: 36, scope: !41)
!43 = !DILocation(line: 39, column: 65, scope: !41)
!44 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 41, type: !9, scopeLine: 41, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 42, column: 7, scope: !44)
!46 = !DILocation(line: 42, column: 38, scope: !44)
!47 = !DILocation(line: 43, column: 36, scope: !44)
!48 = !DILocation(line: 44, column: 3, scope: !44)
!49 = !DILocation(line: 45, column: 36, scope: !44)
!50 = !DILocation(line: 47, column: 1, scope: !44)
!51 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 50, column: 36, scope: !51)
!53 = !DILocation(line: 50, column: 34, scope: !51)
!54 = !DILocation(line: 51, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 53, column: 34, scope: !55)
!57 = !DILocation(line: 54, column: 1, scope: !55)
