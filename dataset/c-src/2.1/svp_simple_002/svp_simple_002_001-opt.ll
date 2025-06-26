; ModuleID = 'svp_simple_002_001-opt.bc'
source_filename = "./svp_simple_002_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_002_001_global_array = common global [100000 x i32] zeroinitializer, align 16
@casee2_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void (...) @idlerun(), !dbg !11
  ret void, !dbg !12
}

declare void @init(...) #1

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_isr_1() #0 !dbg !13 {
  br label %1, !dbg !14

1:                                                ; preds = %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %12, %11 ], !dbg !15
  %2 = icmp slt i32 %.0, 100000, !dbg !16
  br i1 %2, label %4, label %3, !dbg !17

3:                                                ; preds = %1
  br label %13

4:                                                ; preds = %1
  %5 = icmp eq i32 %.0, 9999, !dbg !18
  br i1 %5, label %6, label %7, !dbg !19

6:                                                ; preds = %4
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !20, !tbaa !21
  br label %7, !dbg !25

7:                                                ; preds = %6, %4
  %8 = icmp eq i32 %.0, 100001, !dbg !26
  br i1 %8, label %9, label %10, !dbg !27

9:                                                ; preds = %7
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !28, !tbaa !21
  br label %10, !dbg !29

10:                                               ; preds = %9, %7
  br label %11, !dbg !30

11:                                               ; preds = %10
  %12 = add nsw i32 %.0, 1, !dbg !31
  br label %1, !dbg !17, !llvm.loop !32

13:                                               ; preds = %3
  %14 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !33, !tbaa !21
  %15 = sub nsw i32 %14, 10, !dbg !34
  %16 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 0), align 16, !dbg !35, !tbaa !21
  %17 = add nsw i32 %16, 10, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_isr_2() #0 !dbg !38 {
  call void (...) @idlerun(), !dbg !39
  store volatile i32 999, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !40, !tbaa !21
  ret void, !dbg !41
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_002_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_002")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_002_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_002")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 11, column: 3, scope: !7)
!11 = !DILocation(line: 12, column: 3, scope: !7)
!12 = !DILocation(line: 13, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "svp_simple_002_001_isr_1", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = !DILocation(line: 17, column: 8, scope: !13)
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocation(line: 17, column: 21, scope: !13)
!17 = !DILocation(line: 17, column: 3, scope: !13)
!18 = !DILocation(line: 18, column: 11, scope: !13)
!19 = !DILocation(line: 18, column: 9, scope: !13)
!20 = !DILocation(line: 18, column: 64, scope: !13)
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C/C++ TBAA"}
!25 = !DILocation(line: 18, column: 23, scope: !13)
!26 = !DILocation(line: 19, column: 11, scope: !13)
!27 = !DILocation(line: 19, column: 9, scope: !13)
!28 = !DILocation(line: 20, column: 48, scope: !13)
!29 = !DILocation(line: 20, column: 7, scope: !13)
!30 = !DILocation(line: 21, column: 3, scope: !13)
!31 = !DILocation(line: 17, column: 36, scope: !13)
!32 = distinct !{!32, !17, !30}
!33 = !DILocation(line: 22, column: 13, scope: !13)
!34 = !DILocation(line: 22, column: 54, scope: !13)
!35 = !DILocation(line: 24, column: 12, scope: !13)
!36 = !DILocation(line: 24, column: 47, scope: !13)
!37 = !DILocation(line: 25, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "svp_simple_002_001_isr_2", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 28, column: 3, scope: !38)
!40 = !DILocation(line: 29, column: 44, scope: !38)
!41 = !DILocation(line: 31, column: 1, scope: !38)
