; ModuleID = 'svp_simple_022_001-opt.bc'
source_filename = "./svp_simple_022_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  %1 = call i32 (...) @rand() #3, !dbg !10
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !13, !tbaa !14
  %2 = call i32 (...) @rand() #3, !dbg !18
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !19, !tbaa !14
  %3 = call i32 (...) @rand() #3, !dbg !20
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !21, !tbaa !14
  call void (...) @init() #3, !dbg !22
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !23, !tbaa !14
  %4 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !24, !tbaa !14
  %5 = icmp sge i32 %4, 12, !dbg !29
  br i1 %5, label %6, label %7, !dbg !24

6:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !30, !tbaa !14
  br label %svp_simple_022_001_func_1.exit, !dbg !31

7:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !32, !tbaa !14
  br label %svp_simple_022_001_func_1.exit

svp_simple_022_001_func_1.exit:                   ; preds = %6, %7
  br label %8, !dbg !33

8:                                                ; preds = %13, %svp_simple_022_001_func_1.exit
  %.0 = phi i32 [ 0, %svp_simple_022_001_func_1.exit ], [ %14, %13 ], !dbg !34
  %9 = icmp slt i32 %.0, 256, !dbg !35
  br i1 %9, label %10, label %15, !dbg !36

10:                                               ; preds = %8
  %11 = sext i32 %.0 to i64, !dbg !37
  %12 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %11, !dbg !37
  store volatile i32 0, i32* %12, align 4, !dbg !38, !tbaa !14
  br label %13, !dbg !39

13:                                               ; preds = %10
  %14 = add nsw i32 %.0, 1, !dbg !40
  br label %8, !dbg !36, !llvm.loop !41

15:                                               ; preds = %8
  %16 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !42, !tbaa !14
  store volatile i32 %16, i32* @svp_simple_022_001_global_var3, align 4, !dbg !47, !tbaa !14
  %17 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !48, !tbaa !14
  store volatile i32 %17, i32* @svp_simple_022_001_global_var3, align 4, !dbg !49, !tbaa !14
  ret void, !dbg !50
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !11 {
  %1 = call i32 (...) @rand(), !dbg !51
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !52, !tbaa !14
  %2 = call i32 (...) @rand(), !dbg !53
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !54, !tbaa !14
  %3 = call i32 (...) @rand(), !dbg !55
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !56, !tbaa !14
  call void (...) @init(), !dbg !57
  ret void, !dbg !58
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !27 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !59, !tbaa !14
  %2 = icmp sge i32 %1, 12, !dbg !61
  br i1 %2, label %3, label %4, !dbg !59

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !62, !tbaa !14
  br label %svp_simple_022_001_func_3.exit, !dbg !63

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !64, !tbaa !14
  br label %svp_simple_022_001_func_3.exit

svp_simple_022_001_func_3.exit:                   ; preds = %3, %4
  ret void, !dbg !65
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !45 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !66, !tbaa !14
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !68, !tbaa !14
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !25 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !70, !tbaa !14
  %2 = icmp sge i32 %1, 12, !dbg !71
  br i1 %2, label %3, label %4, !dbg !70

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !72, !tbaa !14
  br label %5, !dbg !73

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !74, !tbaa !14
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !43 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !76, !tbaa !14
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !77, !tbaa !14
  ret void, !dbg !78
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !79 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !80, !tbaa !14
  ret void, !dbg !81
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_022")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_022")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 43, column: 36, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 30, column: 3, scope: !7)
!13 = !DILocation(line: 43, column: 34, scope: !11, inlinedAt: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 44, column: 36, scope: !11, inlinedAt: !12)
!19 = !DILocation(line: 44, column: 34, scope: !11, inlinedAt: !12)
!20 = !DILocation(line: 45, column: 36, scope: !11, inlinedAt: !12)
!21 = !DILocation(line: 45, column: 34, scope: !11, inlinedAt: !12)
!22 = !DILocation(line: 47, column: 3, scope: !11, inlinedAt: !12)
!23 = !DILocation(line: 32, column: 34, scope: !7)
!24 = !DILocation(line: 55, column: 7, scope: !25, inlinedAt: !26)
!25 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = distinct !DILocation(line: 50, column: 36, scope: !27, inlinedAt: !28)
!27 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 50, type: !9, scopeLine: 50, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = distinct !DILocation(line: 33, column: 3, scope: !7)
!29 = !DILocation(line: 55, column: 38, scope: !25, inlinedAt: !26)
!30 = !DILocation(line: 56, column: 36, scope: !25, inlinedAt: !26)
!31 = !DILocation(line: 57, column: 3, scope: !25, inlinedAt: !26)
!32 = !DILocation(line: 58, column: 36, scope: !25, inlinedAt: !26)
!33 = !DILocation(line: 35, column: 8, scope: !7)
!34 = !DILocation(line: 0, scope: !7)
!35 = !DILocation(line: 35, column: 17, scope: !7)
!36 = !DILocation(line: 35, column: 3, scope: !7)
!37 = !DILocation(line: 36, column: 5, scope: !7)
!38 = !DILocation(line: 36, column: 40, scope: !7)
!39 = !DILocation(line: 37, column: 3, scope: !7)
!40 = !DILocation(line: 35, column: 25, scope: !7)
!41 = distinct !{!41, !36, !39}
!42 = !DILocation(line: 63, column: 36, scope: !43, inlinedAt: !44)
!43 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!44 = distinct !DILocation(line: 52, column: 36, scope: !45, inlinedAt: !46)
!45 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!46 = distinct !DILocation(line: 38, column: 3, scope: !7)
!47 = !DILocation(line: 63, column: 34, scope: !43, inlinedAt: !44)
!48 = !DILocation(line: 39, column: 36, scope: !7)
!49 = !DILocation(line: 39, column: 34, scope: !7)
!50 = !DILocation(line: 40, column: 1, scope: !7)
!51 = !DILocation(line: 43, column: 36, scope: !11)
!52 = !DILocation(line: 43, column: 34, scope: !11)
!53 = !DILocation(line: 44, column: 36, scope: !11)
!54 = !DILocation(line: 44, column: 34, scope: !11)
!55 = !DILocation(line: 45, column: 36, scope: !11)
!56 = !DILocation(line: 45, column: 34, scope: !11)
!57 = !DILocation(line: 47, column: 3, scope: !11)
!58 = !DILocation(line: 48, column: 1, scope: !11)
!59 = !DILocation(line: 55, column: 7, scope: !25, inlinedAt: !60)
!60 = distinct !DILocation(line: 50, column: 36, scope: !27)
!61 = !DILocation(line: 55, column: 38, scope: !25, inlinedAt: !60)
!62 = !DILocation(line: 56, column: 36, scope: !25, inlinedAt: !60)
!63 = !DILocation(line: 57, column: 3, scope: !25, inlinedAt: !60)
!64 = !DILocation(line: 58, column: 36, scope: !25, inlinedAt: !60)
!65 = !DILocation(line: 50, column: 65, scope: !27)
!66 = !DILocation(line: 63, column: 36, scope: !43, inlinedAt: !67)
!67 = distinct !DILocation(line: 52, column: 36, scope: !45)
!68 = !DILocation(line: 63, column: 34, scope: !43, inlinedAt: !67)
!69 = !DILocation(line: 52, column: 65, scope: !45)
!70 = !DILocation(line: 55, column: 7, scope: !25)
!71 = !DILocation(line: 55, column: 38, scope: !25)
!72 = !DILocation(line: 56, column: 36, scope: !25)
!73 = !DILocation(line: 57, column: 3, scope: !25)
!74 = !DILocation(line: 58, column: 36, scope: !25)
!75 = !DILocation(line: 60, column: 1, scope: !25)
!76 = !DILocation(line: 63, column: 36, scope: !43)
!77 = !DILocation(line: 63, column: 34, scope: !43)
!78 = !DILocation(line: 64, column: 1, scope: !43)
!79 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 65, type: !9, scopeLine: 65, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 66, column: 34, scope: !79)
!81 = !DILocation(line: 67, column: 1, scope: !79)
